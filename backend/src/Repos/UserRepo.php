<?php

namespace Server\Repos;

use Server\Entities\User;


class UserRepo
{
    public function __construct(private \PDO $pdo)
    {
    }

    public function addUser(User $user): void
    {
        $stmt = $this->pdo->prepare(
            'INSERT INTO `user` (user_email, pass_hash, first_name, last_name) 
            VALUES (:user_email, :pass_hash, :first_name, :last_name)'
        );

        $stmt->execute([
            ':user_email' => (string) $user->getUserEmail(),
            ':pass_hash' => (string) $user->getPassHash(),
            ':first_name' => (string) $user->getFirstName(),
            ':last_name' => (string) $user->getLastName(),
        ]);
    }

    public function getUser(string $userEmail): ?User
    {
        $stmt = $this->pdo->prepare(
            "SELECT user_email as userEmail, pass_hash as passHash, first_name as firstName, last_name as lastName
            FROM user 
            WHERE user_email = :userEmail"
        );

        $stmt->execute([
            ':userEmail' => (string) $userEmail
        ]);

        $result = $stmt->fetchAll(\PDO::FETCH_CLASS | \PDO::FETCH_PROPS_LATE, User::class)[0] ?? null;
        return $result;
    }
}
