# NAME

Acme::Idol - 간단히 사용할 수 있는 오픈 소스 아이돌(웃음) 구현체

# SYNOPSIS

    #!/usr/bin/env perl
    use 5.010;
    use utf8;
    use strict;
    use warnings;

    use Acme::Idol;

    die "root가 아니잖아! 나 작동 그만둘래!" if ($< != 0);

    my $idol = Acme::Idol->new({
        # 판사님 conoha는 제 고양이 이름입니다.
        # 딱히 모 서비스에 대한 악의는 없습니다. 
        name => 'conoha',
        retire_message => 'DDoS 터졌잖아! 나 서비스 그만둘래!',
        after_retire => sub {
            system('shutdown', '-hP', 'now');
        }
    });

    # TODO: Mojolicious, Dancer 등의 웹 프레임워크나 IPC를 붙여서
    #       아이돌을 그만두게 해 보세요!

# METHODS

- `DEFAULT_NAME`

    `new` 생성자에서 `name` 속성을 지정하지 않으면 설정되는 기본값입니다.

- `DEFAULT_RETIRE_MESSAGE`

    `new` 생성자에서 `retire_message` 속성을 지정하지 않으면 설정되는 기본값입니다.

- `new($property_as_hashref)`

    새 `Acme::Idol` 객체를 생성합니다. 대응하고 있는 속성은 다음과 같습니다.

    - `name` - 이름
    - `retire_message` - 아이돌을 그만둘 때 표시할 메시지
    - `after_retire` (coderef) - 아이돌을 그만두고 나서 호출할 콜백

- `DESTROY`

    소멸자입니다. 호출 시점까지 아이돌을 그만 두지 않았으면 강제로 그만 두게 만듭니다.

- `name($name)`

    `name` 속성에 대한 getter/setter입니다.

- `is_retired()`

    아이돌을 그만 뒀는지 여부를 반환합니다.

- `retire()`

    아이돌을 그만 둡니다.

# AUTHOR

치즈군★ ([@\_KAWAll](http://twitter.com/_KAWAll))

# LICENSE

이 소프트웨어는 Artistic License를 따릅니다.
