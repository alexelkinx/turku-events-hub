<?php

namespace Server\Entities;

class Sport
{
    public function __construct(
        private string $id = '',
        private string $title = '',
        private string $description = '',
        private string $type = '',
        private string $image = '',
        private string $location = '',
    ) {
        $this->id = $id;
        $this->description = $description;
        $this->title = $title;
        $this->type = $type;
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

    public function getType(): string
    {
        return $this->type;
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
