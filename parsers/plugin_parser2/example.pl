use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../modules/";
use PluginParser::Parser;

module_load('PluginParser::Maintenance::Autojoin');
module_load('PluginParser::Maintenance::NickBump');
module_load('PluginParser::Maintenance::ServerPing');
module_load('PluginParser::Basic::About');
module_load('PluginParser::Basic::CTCP');
module_load('PluginParser::Basic::Hug');
module_load('PluginParser::Temperature');
module_load('PluginParser::Time');
module_load('PluginParser::Internet::FetchTitle');
module_load('PluginParser::Internet::Youtube');
module_load('PluginParser::Games::Actions');
module_load('PluginParser::Games::Dice');
module_load('PluginParser::Games::Eightball');