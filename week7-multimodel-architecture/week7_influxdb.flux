// ============================================================
// AI Movie Recommendation System
// Time Series (InfluxDB OSS 2.7 via WSL2/Ubuntu)
// ============================================================

// ═══════════════════════════════════════════════════════════
// LOAD SAMPLE DATA — LINE PROTOCOL DATA
// ═══════════════════════════════════════════════════════════

/*
viewing_events,username=ShadyWeah,movie_title=Children_of_Pepper_Bird,genre=Drama watch_duration_min=145i,completed=1i 1746144000000000000
viewing_events,username=ShadyWeah,movie_title=The_Loma_Way,genre=Drama watch_duration_min=138i,completed=1i 1746921600000000000
viewing_events,username=ShadyWeah,movie_title=Dust_on_the_Pepper_Coast,genre=Thriller watch_duration_min=110i,completed=0i 1748736000000000000
viewing_events,username=ShadyWeah,movie_title=The_Dark_Frequency,genre=Thriller watch_duration_min=98i,completed=1i 1749945600000000000
viewing_events,username=LibWest,movie_title=Monrovia_After_Midnight,genre=Thriller watch_duration_min=112i,completed=1i 1747440000000000000
viewing_events,username=LibWest,movie_title=Neon_Horizons,genre=Sci-Fi watch_duration_min=128i,completed=1i 1748995200000000000
viewing_events,username=DecentThaGreat,movie_title=Iron_Mine_Blues,genre=Action watch_duration_min=90i,completed=0i 1747872000000000000
viewing_events,username=DecentThaGreat,movie_title=Grebo_Sunrise,genre=Romance watch_duration_min=120i,completed=1i 1749340800000000000
viewing_events,username=LightBringer,movie_title=The_Loma_Way,genre=Drama watch_duration_min=138i,completed=1i 1746057600000000000
viewing_events,username=LightBringer,movie_title=The_Dark_Frequency,genre=Thriller watch_duration_min=98i,completed=1i 1749686400000000000
viewing_events,username=TooSmooth,movie_title=Fanti_Market_Girl,genre=Romance watch_duration_min=110i,completed=1i 1749081600000000000
viewing_events,username=TooSmooth,movie_title=Last_Signal_from_Buchanan,genre=Sci-Fi watch_duration_min=80i,completed=0i 1748217600000000000
*/

// ═══════════════════════════════════════════════════════════
// FLUX QUERIES
// ═══════════════════════════════════════════════════════════

// Q1: All viewing events for ShadyWeah (AI input — full watch history)
from(bucket: "viewing_history")
  |> range(start: 2025-01-01T00:00:00Z, stop: 2027-01-01T00:00:00Z)
  |> filter(fn: (r) => r._measurement == "viewing_events")
  |> filter(fn: (r) => r.username == "ShadyWeah")
  |> pivot(rowKey: ["_time"], columnKey: ["_field"], valueColumn: "_value")
  |> keep(columns: ["_time", "username", "movie_title", "genre", "watch_duration_min", "completed"])
  |> sort(columns: ["_time"], desc: true)

// Q2: Average watch duration per genre across all customers
from(bucket: "viewing_history")
  |> range(start: 2025-01-01T00:00:00Z, stop: 2027-01-01T00:00:00Z)
  |> filter(fn: (r) => r._measurement == "viewing_events" and r._field == "watch_duration_min")
  |> group(columns: ["genre"])
  |> mean()
  |> rename(columns: {_value: "avg_watch_duration_min"})
  |> sort(columns: ["avg_watch_duration_min"], desc: true)

// Q3: Completion rate by customer
from(bucket: "viewing_history")
  |> range(start: 2025-01-01T00:00:00Z, stop: 2027-01-01T00:00:00Z)
  |> filter(fn: (r) => r._measurement == "viewing_events" and r._field == "completed")
  |> group(columns: ["username"])
  |> mean()
  |> rename(columns: {_value: "completion_rate"})
  |> sort(columns: ["completion_rate"], desc: true)

// Q4: Rental activity count per month
from(bucket: "viewing_history")
  |> range(start: 2025-01-01T00:00:00Z, stop: 2027-01-01T00:00:00Z)
  |> filter(fn: (r) => r._measurement == "viewing_events" and r._field == "watch_duration_min")
  |> aggregateWindow(every: 1mo, fn: count, createEmpty: false)
  |> rename(columns: {_value: "rentals_that_month"})

// Q5: ShadyWeah's watch duration trend over time
from(bucket: "viewing_history")
  |> range(start: 2025-01-01T00:00:00Z, stop: 2027-01-01T00:00:00Z)
  |> filter(fn: (r) => r._measurement == "viewing_events")
  |> filter(fn: (r) => r.username == "ShadyWeah")
  |> filter(fn: (r) => r._field == "watch_duration_min")
  |> sort(columns: ["_time"])

// Q6: Movies with low completion rates (under 100 min watched)
from(bucket: "viewing_history")
  |> range(start: 2025-01-01T00:00:00Z, stop: 2027-01-01T00:00:00Z)
  |> filter(fn: (r) => r._measurement == "viewing_events" and r._field == "watch_duration_min")
  |> filter(fn: (r) => r._value < 100)
  |> pivot(rowKey: ["_time"], columnKey: ["_field"], valueColumn: "_value")
  |> keep(columns: ["_time", "username", "movie_title", "genre", "watch_duration_min"])
  |> sort(columns: ["watch_duration_min"])
