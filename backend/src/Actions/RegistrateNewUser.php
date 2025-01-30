<?php

namespace Server\Actions;

use Server\http\{ErrorResponse, Request, Response, SuccessfulResponse};
use Server\Actions\ActionInterface;
use Server\Entities\User;
use Server\Repos\UserRepo;

class RegistrateNewUser implements ActionInterface
{
    public function __construct(private UserRepo $userRepo)
    {
    }

    public function handle(Request $request): Response
    {
        $passHash = password_hash($request->jsonBodyField('password'), PASSWORD_DEFAULT);

        try {
            $user = new User(
                $request->jsonBodyField('user_email'),
                $passHash,
                $request->jsonBodyField('first_name'),
                $request->jsonBodyField('last_name'),
            );
        } catch (\Exception $error) {
            return new ErrorResponse($error->getMessage(), 404);
        }

        try {
            $this->userRepo->addUser($user);
        } catch (\Exception $error) {
            return new ErrorResponse($error->getMessage(), 404);
        }

        return new SuccessfulResponse([
            'user' => $user->getFirstName()
        ]);
    }
}
