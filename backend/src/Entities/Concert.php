<?php

namespace Server\Entities;

class Concert
{
    public function __construct(
        private string $id = '',
        private string $title = '',
        private string $description = '',
        private string $genre = '',
        private int $views = 0,
        private string $image = '',
        private string $location = '',
    ) {
        $this->id = $id;
        $this->title = $title;
        $this->description = $description;
        $this->genre = $genre;
        $this->views = $views;
        $this->image = $image;
        $this->location = $location;
    }

    public function getId(): string
    {
        return $this->id;
    }

    public function getTitle(): string
    {
        return $this->title;
    }

    public function getDescription(): string
    {
        return $this->description;
    }

    public function getGenre(): string
    {
        return $this->genre;
    }

    public function getViews(): int
    {
        return $this->views;
    }

    public function getImage(): string
    {
        return $this->image;
    }

    public function getLocation(): string
    {
        return $this->location;
    }
}
