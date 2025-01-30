<?php

namespace Server\Actions;

use Server\http\{Request, Response, SuccessfulResponse};
use Server\Actions\ActionInterface;

class LogOut implements ActionInterface
{
    public function __construct()
    {
    }

    public function handle(Request $request): Response
    {
        session_start();
        session_destroy();
        return new SuccessfulResponse(['logout' => 'success']);
    }
}
