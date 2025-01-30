<?php

namespace Server\Actions;

use Server\http\{ErrorResponse, Request, Response, SuccessfulResponse};
use Server\Actions\ActionInterface;
use Server\Repos\TheatreRepo;

class FindTheatres implements ActionInterface
{
    public function __construct(private TheatreRepo $theatreRepo)
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
            $theatres = $this->theatreRepo->getTheatre($date);

            // Prepare the response data
            $data['events'] = $theatres;

            return new SuccessfulResponse($data);
        } catch (\Exception $e) {
            return new ErrorResponse($e->getMessage(), 404);
        }
    }
}
