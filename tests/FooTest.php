<?php

declare(strict_types=1);

namespace WickedByte\Tests\App;

use PHPUnit\Framework\Attributes\CoversClass;
use PHPUnit\Framework\Attributes\Test;
use PHPUnit\Framework\TestCase;
use WickedByte\App\Foo;

#[CoversClass(Foo::class)]
class FooTest extends TestCase
{
    #[Test]
    public function barReturns42(): void
    {
        self::assertSame(42, Foo::bar());
    }
}
