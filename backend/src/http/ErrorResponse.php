<?php

namespace Server\http;

use Server\http\Response;

class ErrorResponse extends Response
{
    protected const SUCCESS = false;

    public function __construct(
        private string $reason = '',
    ) {
    }

    public function payload(): array
    {
        return ['reason' => $this->reason];
    }
}
