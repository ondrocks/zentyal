# Copyright (C) 2008-2013 Zentyal S.L.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License, version 2, as
# published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

use strict;
use warnings;

package EBox::Logout::CGI::Index;
use base 'EBox::CGI::ClientRawBase';

use EBox::Global;
use EBox::Gettext;

sub new
{
    my $class = shift;
    my $self = $class->SUPER::new('title' => __('Logout'),
                                  'template' => '/logout/index.mas',
                                  @_);
    bless($self, $class);
    return $self;
}

sub _process
{
    my ($self) = @_;
    my $global = EBox::Global->getInstance();
    if ($global->unsaved) {
        $self->{params} = ['unsaved' => 'yes'];
    }
}

sub _loggedIn
{
    return 1;
}

sub _print
{
    my ($self) = @_;
    $self->_printPopup();
}


1;
