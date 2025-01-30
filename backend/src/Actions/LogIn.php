<?php

namespace Server\Actions;

use Server\http\{ErrorResponse, Request, Response, SuccessfulResponse};
use Server\Actions\ActionInterface;
use Server\Entities\User;
use Server\Repos\UserRepo;

class LogIn implements ActionInterface
{
    public function __construct(private UserRepo $userRepo)
    {
    }

    public function auth(User $user, string $password): bool
    {
        if (isset($user) && password_verify($password, $user->getPassHash())) {

            $_SESSION['user_email'] = $user->getUserEmail();
            return true;
        } else {
            return false;
        }
    }


    public function handle(Request $request): Response
    {
        session_start();

        if (isset($_SESSION['username'])) {
            header('/account.html');
        }


        try {
            $userEmail = $request->jsonBodyField('user_email');
            $pass = $request->jsonBodyField('password');

            $user = $this->userRepo->getUser($userEmail);
        } catch (\Exception $error) {
            return new ErrorResponse($error->getMessage());
        }

        if ($this->auth($user, $pass)) {
            return new SuccessfulResponse([]);
        } else {
            return new ErrorResponse('Invalid email or password');
        }
    }
}
