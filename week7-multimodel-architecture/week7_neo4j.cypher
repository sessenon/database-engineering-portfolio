// ============================================================
   AI Movie Recommendation System
   Graph (Neo4j AuraDB Free Tier)
// ============================================================

// ─────────────────────────────────────────
   Create Customer nodes
// ─────────────────────────────────────────
CREATE (:Customer {username: 'ShadyWeah', membership: 'Premium', age: 28});
CREATE (:Customer {username: 'LibWest', membership: 'Standard', age: 34});
CREATE (:Customer {username: 'DecentThaGreat', membership: 'Basic', age: 22});
CREATE (:Customer {username: 'LightBringer', membership: 'Premium', age: 30});
CREATE (:Customer {username: 'TooSmooth', membership: 'Standard', age: 26});

// ─────────────────────────────────────────
   Create Movie nodes
// ─────────────────────────────────────────
CREATE (:Movie {title: 'Children of Pepper Bird', genre: 'Drama', rating: 9.1});
CREATE (:Movie {title: 'Monrovia After Midnight', genre: 'Thriller', rating: 8.2});
CREATE (:Movie {title: 'The Loma Way', genre: 'Drama', rating: 8.7});
CREATE (:Movie {title: 'Iron Mine Blues', genre: 'Action', rating: 7.9});
CREATE (:Movie {title: 'Fanti Market Girl', genre: 'Romance', rating: 8.0});
CREATE (:Movie {title: 'Dust on the Pepper Coast', genre: 'Thriller', rating: 8.4});
CREATE (:Movie {title: 'Neon Horizons', genre: 'Sci-Fi', rating: 7.8});
CREATE (:Movie {title: 'The Dark Frequency', genre: 'Thriller', rating: 7.5});
CREATE (:Movie {title: 'Grebo Sunrise', genre: 'Romance', rating: 8.3});
CREATE (:Movie {title: 'Last Signal from Buchanan', genre: 'Sci-Fi', rating: 7.2});

// ─────────────────────────────────────────
   Create Genre nodes
// ─────────────────────────────────────────
CREATE (:Genre {name: 'Drama'});
CREATE (:Genre {name: 'Thriller'});
CREATE (:Genre {name: 'Action'});
CREATE (:Genre {name: 'Romance'});
CREATE (:Genre {name: 'Sci-Fi'});

// ─────────────────────────────────────────
   Movie BELONGS_TO Genre relationships
// ─────────────────────────────────────────
MATCH (m:Movie {title: 'Children of Pepper Bird'}), (g:Genre {name: 'Drama'}) CREATE (m)-[:BELONGS_TO]->(g);
MATCH (m:Movie {title: 'Monrovia After Midnight'}), (g:Genre {name: 'Thriller'}) CREATE (m)-[:BELONGS_TO]->(g);
MATCH (m:Movie {title: 'The Loma Way'}), (g:Genre {name: 'Drama'}) CREATE (m)-[:BELONGS_TO]->(g);
MATCH (m:Movie {title: 'Iron Mine Blues'}), (g:Genre {name: 'Action'}) CREATE (m)-[:BELONGS_TO]->(g);
MATCH (m:Movie {title: 'Fanti Market Girl'}), (g:Genre {name: 'Romance'}) CREATE (m)-[:BELONGS_TO]->(g);
MATCH (m:Movie {title: 'Dust on the Pepper Coast'}), (g:Genre {name: 'Thriller'}) CREATE (m)-[:BELONGS_TO]->(g);
MATCH (m:Movie {title: 'Neon Horizons'}), (g:Genre {name: 'Sci-Fi'}) CREATE (m)-[:BELONGS_TO]->(g);
MATCH (m:Movie {title: 'The Dark Frequency'}), (g:Genre {name: 'Thriller'}) CREATE (m)-[:BELONGS_TO]->(g);
MATCH (m:Movie {title: 'Grebo Sunrise'}), (g:Genre {name: 'Romance'}) CREATE (m)-[:BELONGS_TO]->(g);
MATCH (m:Movie {title: 'Last Signal from Buchanan'}), (g:Genre {name: 'Sci-Fi'}) CREATE (m)-[:BELONGS_TO]->(g);

// ─────────────────────────────────────────
   Customer RENTED Movie relationships
// ─────────────────────────────────────────
MATCH (c:Customer {username: 'ShadyWeah'}), (m:Movie {title: 'Children of Pepper Bird'}) CREATE (c)-[:RENTED {date: '2026-05-01'}]->(m);
MATCH (c:Customer {username: 'ShadyWeah'}), (m:Movie {title: 'The Loma Way'}) CREATE (c)-[:RENTED {date: '2026-05-10'}]->(m);
MATCH (c:Customer {username: 'ShadyWeah'}), (m:Movie {title: 'Dust on the Pepper Coast'}) CREATE (c)-[:RENTED {date: '2026-06-01'}]->(m);
MATCH (c:Customer {username: 'ShadyWeah'}), (m:Movie {title: 'The Dark Frequency'}) CREATE (c)-[:RENTED {date: '2026-06-15'}]->(m);
MATCH (c:Customer {username: 'LibWest'}), (m:Movie {title: 'Monrovia After Midnight'}) CREATE (c)-[:RENTED {date: '2026-05-15'}]->(m);
MATCH (c:Customer {username: 'LibWest'}), (m:Movie {title: 'Neon Horizons'}) CREATE (c)-[:RENTED {date: '2026-06-05'}]->(m);
MATCH (c:Customer {username: 'DecentThaGreat'}), (m:Movie {title: 'Iron Mine Blues'}) CREATE (c)-[:RENTED {date: '2026-05-20'}]->(m);
MATCH (c:Customer {username: 'DecentThaGreat'}), (m:Movie {title: 'Grebo Sunrise'}) CREATE (c)-[:RENTED {date: '2026-06-10'}]->(m);
MATCH (c:Customer {username: 'LightBringer'}), (m:Movie {title: 'The Loma Way'}) CREATE (c)-[:RENTED {date: '2026-04-28'}]->(m);
MATCH (c:Customer {username: 'LightBringer'}), (m:Movie {title: 'The Dark Frequency'}) CREATE (c)-[:RENTED {date: '2026-06-12'}]->(m);
MATCH (c:Customer {username: 'TooSmooth'}), (m:Movie {title: 'Fanti Market Girl'}) CREATE (c)-[:RENTED {date: '2026-06-08'}]->(m);
MATCH (c:Customer {username: 'TooSmooth'}), (m:Movie {title: 'Last Signal from Buchanan'}) CREATE (c)-[:RENTED {date: '2026-05-25'}]->(m);

// ─────────────────────────────────────────
   Customer LIKED Movie relationships
// ─────────────────────────────────────────
MATCH (c:Customer {username: 'ShadyWeah'}), (m:Movie {title: 'Children of Pepper Bird'}) CREATE (c)-[:LIKED {rating: 5}]->(m);
MATCH (c:Customer {username: 'ShadyWeah'}), (m:Movie {title: 'Dust on the Pepper Coast'}) CREATE (c)-[:LIKED {rating: 4}]->(m);
MATCH (c:Customer {username: 'LightBringer'}), (m:Movie {title: 'The Loma Way'}) CREATE (c)-[:LIKED {rating: 5}]->(m);
MATCH (c:Customer {username: 'TooSmooth'}), (m:Movie {title: 'Fanti Market Girl'}) CREATE (c)-[:LIKED {rating: 4}]->(m);
MATCH (c:Customer {username: 'LibWest'}), (m:Movie {title: 'Neon Horizons'}) CREATE (c)-[:LIKED {rating: 4}]->(m);

// ─────────────────────────────────────────
   Movie SIMILAR_TO relationships
// ─────────────────────────────────────────
MATCH (a:Movie {title: 'Children of Pepper Bird'}), (b:Movie {title: 'The Loma Way'}) CREATE (a)-[:SIMILAR_TO {score: 0.91}]->(b);
MATCH (a:Movie {title: 'Children of Pepper Bird'}), (b:Movie {title: 'Grebo Sunrise'}) CREATE (a)-[:SIMILAR_TO {score: 0.85}]->(b);
MATCH (a:Movie {title: 'Monrovia After Midnight'}), (b:Movie {title: 'Dust on the Pepper Coast'}) CREATE (a)-[:SIMILAR_TO {score: 0.87}]->(b);
MATCH (a:Movie {title: 'Monrovia After Midnight'}), (b:Movie {title: 'The Dark Frequency'}) CREATE (a)-[:SIMILAR_TO {score: 0.82}]->(b);
MATCH (a:Movie {title: 'Neon Horizons'}), (b:Movie {title: 'Last Signal from Buchanan'}) CREATE (a)-[:SIMILAR_TO {score: 0.85}]->(b);
MATCH (a:Movie {title: 'Fanti Market Girl'}), (b:Movie {title: 'Grebo Sunrise'}) CREATE (a)-[:SIMILAR_TO {score: 0.88}]->(b);

// ─────────────────────────────────────────
// QUERIES
// ─────────────────────────────────────────

// Q1: All movies ShadyWeah has rented
MATCH (c:Customer {username: 'ShadyWeah'})-[:RENTED]->(m:Movie)
RETURN c.username AS customer, m.title AS movie, m.genre AS genre, m.rating AS rating
ORDER BY m.rating DESC;

// Q2: Collaborative filtering — movies rented by customers who share ShadyWeah's taste
MATCH (me:Customer {username: 'ShadyWeah'})-[:RENTED]->(m:Movie)<-[:RENTED]-(other:Customer)
MATCH (other)-[:RENTED]->(rec:Movie)
WHERE NOT (me)-[:RENTED]->(rec)
RETURN DISTINCT rec.title AS recommended_movie, rec.genre AS genre, rec.rating AS rating
ORDER BY rec.rating DESC;

// Q3: Content-based filtering — movies similar to ones ShadyWeah liked
MATCH (me:Customer {username: 'ShadyWeah'})-[:LIKED]->(m:Movie)-[:SIMILAR_TO]->(rec:Movie)
WHERE NOT (me)-[:RENTED]->(rec)
RETURN rec.title AS recommended_movie, rec.genre AS genre, rec.rating AS rating, m.title AS because_you_liked
ORDER BY rec.rating DESC;

// Q4: Genre affinity map — which genres does each customer gravitate toward?
MATCH (c:Customer)-[:RENTED]->(m:Movie)-[:BELONGS_TO]->(g:Genre)
RETURN c.username AS customer, g.name AS genre, COUNT(*) AS rental_count
ORDER BY customer, rental_count DESC;

// Q5: Top rated movies not yet rented by ShadyWeah
MATCH (m:Movie)
WHERE NOT (:Customer {username: 'ShadyWeah'})-[:RENTED]->(m)
RETURN m.title AS unwatched_movie, m.genre AS genre, m.rating AS rating
ORDER BY m.rating DESC;
