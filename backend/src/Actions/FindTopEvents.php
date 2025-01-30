<?php

namespace Server\Actions;

use Server\http\{ErrorResponse, Request, Response, SuccessfulResponse};
use Server\Actions\ActionInterface;
use Server\Repos\EventRepo;

class FindTopEvents implements ActionInterface
{
    public function __construct(private EventRepo $eventRepo)
    {
    }

    public function handle(Request $request): Response
    {
        try {
            $topEvents = $this->eventRepo->getTop();

            // Prepare the response data
            $data['topEvents'] = $topEvents;

            return new SuccessfulResponse($data);
        } catch (\Exception $e) {
            http_response_code(404);
            return new ErrorResponse($e->getMessage());
        }
    }
}
