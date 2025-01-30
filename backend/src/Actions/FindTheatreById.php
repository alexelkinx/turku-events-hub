<?php

namespace Server\Actions;

use Server\http\{ErrorResponse, Request, Response, SuccessfulResponse};
use Server\Repos\TheatreRepo;
use Server\Actions\ActionInterface;

class FindTheatreById implements ActionInterface
{
    public function __construct(private TheatreRepo $theatreRepo)
    {
    }

    public function handle(Request $request): Response
    {
        $id =  $request->query('id');

        try {
            $this->theatreRepo->updateViews($id);
            $theatre = $this->theatreRepo->getById($id);
            $schedule = $this->theatreRepo->getSchedule($id);
        } catch (\Exception $error) {
            return new ErrorResponse($error->getMessage(), 404);
        }

        return new SuccessfulResponse([
            'title' => $theatre->getTitle(),
            'description' => $theatre->getDescription(),
            'director' => $theatre->getDirector(),
            'duration' => $theatre->getDuration(),
            'cast' => $theatre->getCast(),
            'genre' => $theatre->getGenre(),
            'image' => $theatre->getImage(),
            'location' => $theatre->getLocation(),
            'schedule' => $schedule
        ]);
    }
}
