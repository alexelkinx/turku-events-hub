<?php

namespace Server\Actions;

use Server\http\{ErrorResponse, Request, Response, SuccessfulResponse};
use Server\Actions\ActionInterface;
use Server\Repos\MovieRepo;

class FindMovieById implements ActionInterface
{
    public function __construct(private MovieRepo $movieRepo)
    {
    }

    public function handle(Request $request): Response
    {
        // Get the 'id' query parameter from the request
        $id =  $request->query('id');

        try {
            // Get the movie and additional information by ID
            $this->movieRepo->updateViews($id);
            $movie = $this->movieRepo->getById($id);
            $schedule = $this->movieRepo->getSchedule($id);
        } catch (\Exception $error) {
            return new ErrorResponse($error->getMessage(), 404);
        }

        // Prepare the response data and send a successful response
        return new SuccessfulResponse([
            'title' => $movie->getTitle(),
            'description' => $movie->getDescription(),
            'duration' => $movie->getDuration(),
            'director' => $movie->getDirector(),
            'cast' => $movie->getCast(),
            'genre' => $movie->getGenre(),
            'image' => $movie->getImage(),
            'location' => $movie->getLocation(),
            'schedule' => $schedule
        ]);
    }
}
