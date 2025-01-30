<?php

namespace Server\Repos;

class EventRepo

{
    public function __construct(private \PDO $pdo)
    {
    }

    public function getAll(string $date): array
    {
        $stmt = $this->pdo->prepare(
            'SELECT DISTINCT movie.id, movie.title, movie.event_type, movie.image 
            FROM movie
            JOIN event_date ON movie.id = event_date.event_id 
            WHERE event_date.date = :date
            UNION SELECT DISTINCT theatre.id, theatre.title, theatre.event_type, theatre.image 
            FROM theatre
            JOIN event_date ON theatre.id = event_date.event_id 
            WHERE event_date.date = :date
            UNION SELECT DISTINCT concert.id, concert.title, concert.event_type, concert.image 
            FROM concert
            JOIN event_date ON concert.id = event_date.event_id 
            WHERE event_date.date = :date
            UNION SELECT DISTINCT sport.id, sport.title, sport.event_type, sport.image 
            FROM sport
            JOIN event_date ON sport.id = event_date.event_id 
            WHERE event_date.date = :date;'
        );

        $stmt->execute([':date' => (string) $date]);

        return $stmt->fetchAll(\PDO::FETCH_ASSOC);
    }

    public function getTop(): array
    {
        $stmt = $this->pdo->prepare(
            // 'WITH all_events AS (
            //     SELECT id, title, views, image, url, event_type FROM concert
            //     UNION ALL
            //     SELECT id, title, views, image, url, event_type FROM movie
            //     UNION ALL
            //     SELECT id, title, views, image, url, event_type FROM sport
            //     UNION ALL
            //     SELECT id, title, views, image, url, event_type FROM theatre
            // ),
            // event_min_dates AS (
            //     SELECT event_id, MIN(date) AS min_date
            //     FROM event_date
            //     WHERE date >= CURRENT_DATE
            //     GROUP BY event_id
            // )
            // SELECT all_events.id, 
            //         all_events.title, 
            //         all_events.views, 
            //         all_events.image, 
            //         all_events.url, 
            //         all_events.event_type, 
            //         event_min_dates.min_date AS date
            // FROM all_events
            // JOIN event_min_dates ON all_events.id = event_min_dates.event_id
            // ORDER BY all_events.views DESC
            // LIMIT 3;'
            'SELECT 
            all_events.id,
            all_events.title,
            all_events.views,
            all_events.image,
            all_events.event_type,
            event_min_dates.min_date AS date
        FROM
            (SELECT id, title, views, image, event_type FROM concert
            UNION ALL
            SELECT id, title, views, image, event_type FROM movie
            UNION ALL
            SELECT id, title, views, image, event_type FROM sport
            UNION ALL
            SELECT id, title, views, image, event_type FROM theatre) AS all_events
        JOIN
            (SELECT event_id, MIN(date) AS min_date
            FROM event_date
            WHERE date >= CURRENT_DATE
            GROUP BY event_id) AS event_min_dates ON all_events.id = event_min_dates.event_id
        ORDER BY
            all_events.views DESC
        LIMIT 3;
        '
        );

        $stmt->execute();

        return $stmt->fetchAll(\PDO::FETCH_ASSOC);
    }
}
