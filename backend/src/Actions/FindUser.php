<?php

namespace Server\Actions;

use Server\http\{ErrorResponse, Request, Response, SuccessfulResponse};
use Server\Actions\ActionInterface;
use Server\Repos\UserRepo;

class FindUser implements ActionInterface
{
    public function __construct(private UserRepo $userRepo)
    {
    }

    public function handle(Request $request): Response
    {

        session_start();

        try {
            $userEmail = $_SESSION['user_email'] ?? null;

            if (!isset($userEmail)) {
                return new SuccessfulResponse([
                    'logged_in' => false,
                ]);
            }

            $user = $this->userRepo->getUser($userEmail);
        } catch (\Exception $error) {
            return new ErrorResponse($error->getMessage());
        }

        return new SuccessfulResponse([
            'logged_in' => true,
            'user' =>
            [
                'user_email' => $user->getUserEmail(),
                'first_name' => $user->getFirstName(),
                'last_name' => $user->getLastName(),
            ]
        ]);
    }
}
