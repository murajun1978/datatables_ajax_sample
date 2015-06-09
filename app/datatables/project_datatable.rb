class ProjectDatatable < AjaxDatatablesRails::Base
  include AjaxDatatablesRails::Extensions::Kaminari

  def_delegators :@view, :link_to, :edit_project_path

  def sortable_columns
    @sortable_columns ||= []
  end

  def searchable_columns
    @searchable_columns ||= []
  end

  private

  def data
    records.map do |record|
      [
        record.title,
        record.description,
        link_to('show', record),
        link_to('edit', edit_project_path(record)),
        link_to('destroy', record, method: :delete, data: { confirm: 'Are you sure?' })
      ]
    end
  end

  def get_raw_records
    Project.filter_title_or_description(params[:search][:value])
  end
end
