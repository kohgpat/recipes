class FormBuilder < ActionView::Helpers::FormBuilder
  def errors_for(name)
    if @object.errors.include?(name)
      label(name, @object.errors[name].first, class: 'error')
    end
  end
end
