<?php

namespace Server\http;

class Request
{
    public function __construct(
        private array $get,
        private array $server,
        private string $body,
    ) {
    }

    // Get the request path
    public function path(): string
    {
        if (!array_key_exists('REQUEST_URI', $this->server)) {
            http_response_code(404);
            throw new \Exception('Cannot get path from the request');
        }

        $components = parse_url($this->server['REQUEST_URI']);

        if (!is_array($components) || !array_key_exists('path', $components)) {
            http_response_code(404);
            throw new \Exception('Cannot get path from the request');
        }

        return $components['path'];
    }

    // Get the request method (e.g., GET, POST)
    public function method(): string
    {
        if (!array_key_exists('REQUEST_METHOD', $this->server)) {
            http_response_code(404);
            throw new \Exception('Cannot get method from the request');
        }

        return $this->server['REQUEST_METHOD'];
    }

    // Get the value of a specific query string parameter
    public function query(string $param): string
    {
        if (!array_key_exists($param, $this->get)) {
            http_response_code(404);
            throw new \Exception("No such query param in the request: $param");
        }

        $value = trim($this->get[$param]);

        return $value;
    }

    // Method for parsing the JSON body of the request
    public function jsonBody(): array
    {
        try {
            $data = json_decode(
                $this->body,
                associative: true,
                flags: JSON_THROW_ON_ERROR
            );
        } catch (\Exception) {
            throw new \Exception('Cannot decode json body');
        }

        if (!is_array($data)) {
            throw new \Exception('Not an array/object in json body');
        }

        return $data;
    }

    // Get a specific field from the JSON body
    public function jsonBodyField(string $field): mixed
    {
        $data = $this->jsonBody();

        if (!array_key_exists($field, $data)) {
            throw new  \Exception("No such field: $field");
        }
        if (empty($data[$field])) {
            throw new  \Exception("Empty field: $field");
        }

        return $data[$field];
    }
}
