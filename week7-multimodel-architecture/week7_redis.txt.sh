# ============================================================
# AI Movie Recommendation System
# ============================================================


# ─────────────────────────────────────────
# Pre-computed Recommendation Lists (LIST)
# ─────────────────────────────────────────

# ShadyWeah
RPUSH recs:ShadyWeah "Monrovia After Midnight"
RPUSH recs:ShadyWeah "Grebo Sunrise"
RPUSH recs:ShadyWeah "Iron Mine Blues"
RPUSH recs:ShadyWeah "Fanti Market Girl"
EXPIRE recs:ShadyWeah 86400

# LibWest
RPUSH recs:LibWest "Last Signal from Buchanan"
RPUSH recs:LibWest "The Dark Frequency"
RPUSH recs:LibWest "Iron Mine Blues"
EXPIRE recs:LibWest 86400

# DecentThaGreat
RPUSH recs:DecentThaGreat "Children of Pepper Bird"
RPUSH recs:DecentThaGreat "Fanti Market Girl"
RPUSH recs:DecentThaGreat "Grebo Sunrise"
EXPIRE recs:DecentThaGreat 86400

# LightBringer
RPUSH recs:LightBringer "Monrovia After Midnight"
RPUSH recs:LightBringer "Dust on the Pepper Coast"
RPUSH recs:LightBringer "Fanti Market Girl"
EXPIRE recs:LightBringer 86400

# TooSmooth
RPUSH recs:TooSmooth "Children of Pepper Bird"
RPUSH recs:TooSmooth "The Loma Way"
RPUSH recs:TooSmooth "Neon Horizons"
EXPIRE recs:TooSmooth 86400

# ─────────────────────────────────────────
# Session Tokens (STRING) 
# ─────────────────────────────────────────
SET session:ShadyWeah "tok_sw_a1b2c3" EX 1800
SET session:LibWest "tok_lw_d4e5f6" EX 1800
SET session:DecentThaGreat "tok_dt_g7h8i9" EX 1800
SET session:LightBringer "tok_lb_j1k2l3" EX 1800
SET session:TooSmooth "tok_ts_m4n5o6" EX 1800

# ─────────────────────────────────────────
# Trending Movies (SORTED SET) 
# ─────────────────────────────────────────
ZADD trending:movies 12 "Children of Pepper Bird"
ZADD trending:movies 10 "Dust on the Pepper Coast"
ZADD trending:movies 9 "The Loma Way"
ZADD trending:movies 8 "Monrovia After Midnight"
ZADD trending:movies 7 "Grebo Sunrise"
ZADD trending:movies 7 "Iron Mine Blues"
ZADD trending:movies 6 "Fanti Market Girl"
ZADD trending:movies 5 "Neon Horizons"
ZADD trending:movies 4 "The Dark Frequency"
ZADD trending:movies 3 "Last Signal from Buchanan"

# ─────────────────────────────────────────
# Customer Engagement Scores (HASH) 
# ─────────────────────────────────────────
HSET engagement:ShadyWeah rentals 4 avg_rating 4.5 days_active 162 score 94
HSET engagement:LibWest rentals 2 avg_rating 4.0 days_active 109 score 71
HSET engagement:DecentThaGreat rentals 2 avg_rating 3.5 days_active 88 score 58
HSET engagement:LightBringer rentals 2 avg_rating 5.0 days_active 236 score 89
HSET engagement:TooSmooth rentals 2 avg_rating 4.0 days_active 131 score 72

# ─────────────────────────────────────────
# QUERIES
# ─────────────────────────────────────────

# Q1: Fetch ShadyWeah's full recommendation list
LRANGE recs:ShadyWeah 0 -1

# Q2: Check if ShadyWeah's session is still active
TTL session:ShadyWeah

# Q3: Top 5 trending movies platform-wide
ZREVRANGE trending:movies 0 4 WITHSCORES

# Q4: Get ShadyWeah's full engagement profile
HGETALL engagement:ShadyWeah

# Q5: Retrieve engagement scores for all customers
HGET engagement:ShadyWeah score
HGET engagement:LibWest score
HGET engagement:DecentThaGreat score
HGET engagement:LightBringer score
HGET engagement:TooSmooth score

# Q6: Pop the top recommendation off ShadyWeah's queue
LPOP recs:ShadyWeah
