<?php

namespace Server\Actions;

use Server\http\{ErrorResponse, Request, Response, SuccessfulResponse};
use Server\Actions\ActionInterface;
use Server\Repos\MovieRepo;

class FindMovies implements ActionInterface
{
    public function __construct(private MovieRepo $movieRepo)
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
            $movies = $this->movieRepo->getMovies($date);

            // Prepare the response data
            $data['events'] = $movies;

            return new SuccessfulResponse($data);
        } catch (\Exception $e) {
            return new ErrorResponse($e->getMessage(), 404);
        }
    }
}
