# Leap - Electronic Individual Learning Plan Software
# Copyright (C) 2011 South Devon College

# Leap is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# Leap is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.

# You should have received a copy of the GNU Affero General Public License
# along with Foobar.  If not, see <http://www.gnu.org/licenses/>.

class Admin::ViewsController < ApplicationController

  before_filter :admin_page

  def index
    @views = View.all
  end

  def edit
    @event_types=Dir.glob(Rails.root + 'app/models/*.rb').map{|f| File.basename(f, ".rb").classify}
    @view = View.find_by_name params[:id]
  end

  def update
    @view = View.find_by_name params[:id]
    if @view.update_attributes params[:view]
      flash[:success] = "Updated view #{@view.name} for #{@view.affiliations.sort.join(", ")}!"
    end
    redirect_to edit_admin_view_path(@view)
  end

end