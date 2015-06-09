$ ->
  $('#project-table').dataTable
    jQueryUI: true
    ordering: false
    processing: true
    serverSide: true
    ajax: '/projects'
