<?php

namespace Server\Entities;

class Movie
{
    public function __construct(
        private string $id = '',
        private string $title = '',
        private string $description = '',
        private string $director = '',
        private string $duration = '',
        private string $cast = '',
        private string $genre = '',
        private string $image = '',
        private string $location = '',

    ) {
        $this->id = $id;
        $this->title = $title;
        $this->description = $description;
        $this->director = $director;
        $this->duration = $duration;
        $this->cast = $cast;
        $this->genre = $genre;
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

    public function getDirector(): string
    {
        return $this->director;
    }

    public function getDuration(): string
    {
        return $this->duration;
    }

    public function getCast(): string
    {
        return $this->cast;
    }

    public function getGenre(): string
    {
        return $this->genre;
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
