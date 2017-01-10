<?php

const GIGASECOND = 1E9;

function from($date)
{
    $ts = $date->getTimestamp();
    return $date->setTimestamp($ts + GIGASECOND);
}
