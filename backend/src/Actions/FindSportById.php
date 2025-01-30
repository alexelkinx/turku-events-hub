<?php

namespace Server\Actions;

use Server\http\{ErrorResponse, Request, Response, SuccessfulResponse};
use Server\Actions\ActionInterface;
use Server\Repos\SportRepo;

class FindSportById implements ActionInterface
{
    public function __construct(private SportRepo $sportsRepo)
    {
    }

    public function handle(Request $request): Response
    {

        $id =  $request->query('id');

        try {
            $this->sportsRepo->updateViews($id);
            $sport = $this->sportsRepo->getById($id);
            $schedule = $this->sportsRepo->getSchedule($id);
        } catch (\Exception $error) {
            return new ErrorResponse($error->getMessage(), 404);
        }

        return new SuccessfulResponse([
            'title' => $sport->getTitle(),
            'description' => $sport->getDescription(),
            'type' => $sport->getType(),
            'image' => $sport->getImage(),
            'location' => $sport->getLocation(),
            'schedule' => $schedule
        ]);
    }
}
