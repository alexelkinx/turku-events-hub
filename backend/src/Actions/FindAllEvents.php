<?php

namespace Server\Actions;

use Server\http\{ErrorResponse, Request, Response, SuccessfulResponse};
use Server\Actions\ActionInterface;
use Server\Repos\EventRepo;

class FindAllEvents implements ActionInterface
{
    public function __construct(private EventRepo $eventRepo)
    {
    }

    public function handle(Request $request): Response
    {
        try {
            $date = $request->query('date');
        } catch (\Exception $e) {
            return new ErrorResponse($e->getMessage());
        }

        try {
            $events = $this->eventRepo->getAll($date);

            // Prepare the response data
            $data['events'] = $events;

            return new SuccessfulResponse($data);
        } catch (\Exception $e) {
            http_response_code(404);
            return new ErrorResponse($e->getMessage());
        }
    }
}
