import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'bootstrap'

Rails.start()
Turbolinks.start()
ActiveStorage.start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")
require("@nathanvda/cocoon")
require("select2")
require("packs/book_card")
require("packs/datetimepicker")
