#!/usr/bin/perl

use Dancer;

set content_type => 'text/plain';

get '/' => sub {
    "Hello There!"
};

get '/hello/:name' => sub {
    my ($params) = @_;
    if ($params->{name} ne 'sukria') {
        status('not_found');
        content_type("text/plain");
        return "Not found";
    }
    return "Hey ".$params->{name}.", how are you?";
};

post '/new' => sub {
    my ($params) = @_;
    "creating new entry: ".$params->{name};
};

Dancer->dance;