module ApplicationHelper
    def full_title(pages_title = "")
        base_title = "Management Library"
        if pages_title.empty?
            base_title
        else
            pages_title + " | " + base_title
        end
    end
end
