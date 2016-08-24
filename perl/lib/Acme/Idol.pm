package Acme::Idol;
use 5.008001;
use utf8;

=encoding utf8

=head1 NAME

Acme::Idol - 간단히 사용할 수 있는 오픈 소스 아이돌(웃음) 구현체

=head1 SYNOPSIS

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

=head1 METHODS

=over 4

=item * C<DEFAULT_NAME>

C<new> 생성자에서 C<name> 속성을 지정하지 않으면 설정되는 기본값입니다.

=item * C<DEFAULT_RETIRE_MESSAGE>

C<new> 생성자에서 C<retire_message> 속성을 지정하지 않으면 설정되는 기본값입니다.

=cut

sub DEFAULT_NAME           () { 'mio' }
sub DEFAULT_RETIRE_MESSAGE () { '나 아이돌 그만둘래!' }


=item * C<new($property_as_hashref)>

새 C<Acme::Idol> 객체를 생성합니다. 대응하고 있는 속성은 다음과 같습니다.

=over 4

=item * C<name> - 이름

=item * C<retire_message> - 아이돌을 그만둘 때 표시할 메시지

=item * C<after_retire> (coderef) - 아이돌을 그만두고 나서 호출할 콜백

=back

=cut

sub new {
    my $class = shift;
    my %prop  = %{ (shift) };

    return bless {
        name => DEFAULT_NAME,
        retire_message => DEFAULT_RETIRE_MESSAGE,

        is_retired => 0,
        %prop
    }, $class;
}


=item * C<DESTROY>

소멸자입니다. 호출 시점까지 아이돌을 그만 두지 않았으면 강제로 그만 두게 만듭니다.

=cut

sub DESTROY {
    my $self = shift;

    $self->retire unless $self->is_retired;
}


=item * C<name($name)>

C<name> 속성에 대한 getter/setter입니다.

=cut

sub name {
    my $self = shift;
    my $name = shift;
    $self->{name} = $name if defined $name;
    return $self->{name};
}

=item * C<is_retired()>

아이돌을 그만 뒀는지 여부를 반환합니다.

=cut

sub is_retired {
    my $self = shift;
    return $self->{is_retired};
}

=item * C<retire()>

아이돌을 그만 둡니다.

=cut

sub retire {
    my $self = shift;
    
    if ($self->is_retired) {
        warn sprintf(
            "%s는 이미 아이돌을 그만 두었습니다.", $self->name
        );
        return;
    }

    $self->{is_retired} = 1;
    warn $self->{retire_message};

    $self->{after_retire}($self) if ref $self->{after_retire} eq 'CODE';
}


=back

=head1 AUTHOR

치즈군★ (L<@_KAWAll|http://twitter.com/_KAWAll>)

=head1 LICENSE

이 소프트웨어는 Artistic License를 따릅니다.

=cut

1;
