package PluginParser::Games::Dice;
use strict;
use warnings;
our @ISA = qw(Exporter);
our @EXPORT_OK = qw(match);

sub match {
  my ($self,$core) = @_;

  if($core->{'receiver_nick'} ne $core->{'botname'}) { return ''; }
  if($core->{'event'} ne 'on_public_message' and $core->{'event'} ne 'on_private_message') { return ''; }

  if($core->{'message'} =~ /^d([0-9]+)$/) {
    return roll_dice($core,$1,1,$core->{'receiver_chan'},$core->{'target'});
  }

  elsif($core->{'message'} =~ /^([0-9]+)d([0-9]+)$/) {
    return roll_dice($core,$2,$1,$core->{'receiver_chan'},$core->{'target'});
  }

  return '';
}

sub roll_dice {
  my ($core,$size,$number,$chan,$target) = @_;
  my $total = int(rand($number*$size-$number))+$number;

  $core->{'output'}->parse("MESSAGE>${chan}>${target}: Rolled ${number} d${size} dice and got ${total}.");
}