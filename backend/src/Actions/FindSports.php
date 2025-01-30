<?php

namespace Server\Actions;

use Server\http\{ErrorResponse, Request, Response, SuccessfulResponse};
use Server\Actions\ActionInterface;
use Server\Repos\SportRepo;

class FindSports implements ActionInterface
{
    public function __construct(private SportRepo $sportRepo)
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
            $sports = $this->sportRepo->getSports($date);

            // Prepare the response data
            $data['events'] = $sports;

            return new SuccessfulResponse($data);
        } catch (\Exception $e) {
            return new ErrorResponse($e->getMessage(), 404);
        }
    }
}
