<?php

namespace Server\Actions;

use Server\http\{ErrorResponse, Request, Response, SuccessfulResponse};
use Server\Actions\ActionInterface;
use Server\Repos\ConcertRepo;

class FindConcerts implements ActionInterface
{
    public function __construct(private ConcertRepo $concertRepo)
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
            $concerts = $this->concertRepo->getConcerts($date);

            // Prepare the response data
            $data['events'] = $concerts;

            return new SuccessfulResponse($data);
        } catch (\Exception $e) {
            return new ErrorResponse($e->getMessage(), 404);
        }
    }
}
