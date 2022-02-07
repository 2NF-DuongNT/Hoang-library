module ApplicationHelper
    def full_title(pages_title = "")
        base_title = "Management Library"
        pages_title.empty? ? (base_title) : (pages_title + " | " + base_title)
    end
end
