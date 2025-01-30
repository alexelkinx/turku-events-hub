<?php

namespace Server\Actions;

use Server\http\{Request, Response};

interface ActionInterface
{
    public function handle(Request $request): Response;
}
