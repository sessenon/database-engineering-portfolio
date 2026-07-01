# ============================================================
  Document (DynamoDB Local + NoSQL Workbench)
# ============================================================

# ─────────────────────────────────────────
# Create CustomerPreferences table
# ─────────────────────────────────────────
aws dynamodb create-table \
  --table-name CustomerPreferences \
  --attribute-definitions AttributeName=username,AttributeType=S \
  --key-schema AttributeName=username,KeyType=HASH \
  --billing-mode PAY_PER_REQUEST \
  --endpoint-url http://192.168.96.1:8001

# ─────────────────────────────────────────
# Insert customer preference documents
# ─────────────────────────────────────────

# Document 1 — ShadyWeah (Premium, Thriller/Drama/Sci-Fi)
aws dynamodb put-item \
  --table-name CustomerPreferences \
  --item '{"username":{"S":"ShadyWeah"},"full_name":{"S":"Shady Weah"},"membership_type":{"S":"Premium"},"age":{"N":"28"},"preferred_genres":{"L":[{"S":"Thriller"},{"S":"Drama"},{"S":"Sci-Fi"}]},"language_preference":{"S":"English"},"max_age_rating":{"S":"R"},"notification_opt_in":{"BOOL":true},"ai_recommendation_enabled":{"BOOL":true},"last_preference_update":{"S":"2026-06-01"},"favorite_movies":{"L":[{"S":"Children of Pepper Bird"},{"S":"Dust on the Pepper Coast"}]}}' \
  --endpoint-url http://192.168.96.1:8001

# Document 2 — LibWest (Standard, Sci-Fi/Action)
aws dynamodb put-item \
  --table-name CustomerPreferences \
  --item '{"username":{"S":"LibWest"},"full_name":{"S":"Lib West"},"membership_type":{"S":"Standard"},"age":{"N":"34"},"preferred_genres":{"L":[{"S":"Sci-Fi"},{"S":"Action"}]},"language_preference":{"S":"English"},"max_age_rating":{"S":"PG-13"},"notification_opt_in":{"BOOL":false},"ai_recommendation_enabled":{"BOOL":true},"last_preference_update":{"S":"2026-05-20"},"favorite_movies":{"L":[{"S":"Neon Horizons"},{"S":"Last Signal from Buchanan"}]}}' \
  --endpoint-url http://192.168.96.1:8001

# Document 3 — DecentThaGreat (Basic, Action/Romance)
aws dynamodb put-item \
  --table-name CustomerPreferences \
  --item '{"username":{"S":"DecentThaGreat"},"full_name":{"S":"Decent Tha Great"},"membership_type":{"S":"Basic"},"age":{"N":"22"},"preferred_genres":{"L":[{"S":"Action"},{"S":"Romance"}]},"language_preference":{"S":"English"},"max_age_rating":{"S":"PG-13"},"notification_opt_in":{"BOOL":true},"ai_recommendation_enabled":{"BOOL":false},"last_preference_update":{"S":"2026-04-10"},"favorite_movies":{"L":[{"S":"Iron Mine Blues"},{"S":"Grebo Sunrise"}]}}' \
  --endpoint-url http://192.168.96.1:8001

# Document 4 — LightBringer (Premium, Drama/Thriller/Romance)
aws dynamodb put-item \
  --table-name CustomerPreferences \
  --item '{"username":{"S":"LightBringer"},"full_name":{"S":"Light Bringer"},"membership_type":{"S":"Premium"},"age":{"N":"30"},"preferred_genres":{"L":[{"S":"Drama"},{"S":"Thriller"},{"S":"Romance"}]},"language_preference":{"S":"English"},"max_age_rating":{"S":"R"},"notification_opt_in":{"BOOL":true},"ai_recommendation_enabled":{"BOOL":true},"last_preference_update":{"S":"2026-06-10"},"favorite_movies":{"L":[{"S":"The Loma Way"},{"S":"Monrovia After Midnight"}]}}' \
  --endpoint-url http://192.168.96.1:8001

# Document 5 — TooSmooth (Standard, Romance/Drama)
aws dynamodb put-item \
  --table-name CustomerPreferences \
  --item '{"username":{"S":"TooSmooth"},"full_name":{"S":"Too Smooth"},"membership_type":{"S":"Standard"},"age":{"N":"26"},"preferred_genres":{"L":[{"S":"Romance"},{"S":"Drama"}]},"language_preference":{"S":"English"},"max_age_rating":{"S":"PG"},"notification_opt_in":{"BOOL":true},"ai_recommendation_enabled":{"BOOL":true},"last_preference_update":{"S":"2026-05-30"},"favorite_movies":{"L":[{"S":"Fanti Market Girl"},{"S":"Grebo Sunrise"}]}}' \
  --endpoint-url http://192.168.96.1:8001


# ─────────────────────────────────────────
# QUERIES (run via NoSQL Workbench Operation Builder)
# ─────────────────────────────────────────

# Q1: GetItem — ShadyWeah's full preference document
# Operation: GetItem | Partition key: username = ShadyWeah

# Q2: Scan — All customers with AI recommendations enabled
# Operation: Scan | Filter: ai_recommendation_enabled = true (Boolean)

# Q3: Scan — Premium members only
# Operation: Scan | Filter: membership_type = Premium (String)

# Q4: UpdateItem — Update ShadyWeah's last preference date
# Operation: UpdateItem | Partition key: username = ShadyWeah
# Update: last_preference_update = 2026-06-25 (String)

# Q5: DeleteItem — Remove DecentThaGreat (account closure simulation)
# Operation: DeleteItem | Partition key: username = DecentThaGreat
