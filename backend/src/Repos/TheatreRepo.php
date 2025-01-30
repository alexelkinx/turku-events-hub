<?php

namespace Server\Repos;

use Server\Entities\Theatre;

class TheatreRepo

{
    public function __construct(private \PDO $pdo)
    {
    }

    public function getTheatre(string $date): array
    {
        $stmt = $this->pdo->prepare(
            'SELECT DISTINCT theatre.id, theatre.title, theatre.event_type, theatre.image 
            FROM theatre 
            JOIN event_date ON theatre.id = event_date.event_id
            WHERE event_date.date = :date'
        );

        $stmt->execute([':date' => (string) $date]);

        return $stmt->fetchAll(\PDO::FETCH_ASSOC);
    }

    public function getById(string $id): ?Theatre
    {
        $stmt = $this->pdo->prepare(
            'SELECT title, description, director, cast, genre, image, location
            FROM theatre
            WHERE id = :id;'
        );

        $stmt->execute([':id' => (string) $id]);

        $result = $stmt->fetchAll(\PDO::FETCH_CLASS | \PDO::FETCH_PROPS_LATE, Theatre::class)[0] ?? null;

        return $result;
    }

    public function getSchedule(string $id): array
    {
        $stmt = $this->pdo->prepare(
            'SELECT event_date.date, DATE_FORMAT(event_time.time, "%H:%i") AS time, event_time.url
            FROM event_date
            JOIN event_time ON event_date.id = event_time.date_id
            WHERE event_date.event_id = :id AND date >= CURRENT_DATE
            ORDER BY event_date.date;'
        );

        $stmt->execute([':id' => (string) $id]);

        return $stmt->fetchAll(\PDO::FETCH_ASSOC);
    }

    public function updateViews(string $id): void
    {
        $stmt = $this->pdo->prepare(
            'UPDATE theatre
            SET views = views + 1
            WHERE id = :id'
        );

        $stmt->execute([':id' => (string) $id]);
    }
}
