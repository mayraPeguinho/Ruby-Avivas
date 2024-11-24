// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import Rails from "@rails/ujs";
Rails.start();

import { Turbo } from "@hotwired/turbo-rails";
Turbo.session.drive = true;  // Activa Turbo si es necesario

import { Stimulus } from "@hotwired/stimulus";
import { Application } from "stimulus";