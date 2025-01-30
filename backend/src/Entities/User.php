<?php

namespace Server\Entities;

class User
{
    public function __construct(
        private string $userEmail = '',
        private string $passHash = '',
        private string $firstName = '',
        private string $lastName = '',
    ) {
        $this->userEmail = $userEmail;
        $this->passHash = $passHash;
        $this->firstName = $firstName;
        $this->lastName = $lastName;
    }

    public function getUserEmail(): string
    {
        return $this->userEmail;
    }

    public function getPassHash(): string
    {
        return $this->passHash;
    }

    public function getFirstName(): string
    {
        return $this->firstName;
    }

    public function getLastName(): string
    {
        return $this->lastName;
    }


    public function setUserEmail(string $userEmail): void
    {
        $this->userEmail = $userEmail;
    }

    public function setPassHash(string $passHash): void
    {
        $this->passHash = $passHash;
    }

    public function setFirstName(string $firstName): void
    {
        $this->firstName = $firstName;
    }

    public function setLastName(string $lastName): void
    {
        $this->lastName = $lastName;
    }
}
