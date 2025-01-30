<?php

namespace Server\Actions;

use Server\http\{ErrorResponse, Request, Response, SuccessfulResponse};
use Server\Actions\ActionInterface;
use Server\Repos\ConcertRepo;

class FindConcertById implements ActionInterface
{
    public function __construct(private ConcertRepo $concertRepo)
    {
    }

    public function handle(Request $request): Response
    {
        $id = $request->query('id');

        try {
            $this->concertRepo->updateViews($id);
            $concert = $this->concertRepo->getById($id);
            $schedule = $this->concertRepo->getSchedule($id);
        } catch (\Exception $error) {
            return new ErrorResponse($error->getMessage(), 404);
        }

        return new SuccessfulResponse([
            'title' => $concert->getTitle(),
            'description' => $concert->getDescription(),
            'type' => $concert->getGenre(),
            'image' => $concert->getImage(),
            'location' => $concert->getLocation(),
            'schedule' => $schedule
        ]);
    }
}
