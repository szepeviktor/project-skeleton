<?php

declare(strict_types=1);

namespace WickedByte\Benchmarks\App;

use PhpBench\Attributes\Iterations;
use PhpBench\Attributes\Revs;
use PhpBench\Attributes\Subject;
use WickedByte\App\Foo;

#[Revs(100_000)]
#[Iterations(5)]
class FooBench
{
    #[Subject]
    public function howFastIs42(): void
    {
        Foo::bar();
    }
}
