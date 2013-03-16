Pod::Spec.new do |s|
  s.name         = "CCFoundation"
  s.version      = "0.0.1"
  s.summary      = "Categories, utilities, and a little magic."
  s.homepage     = "https://github.com/mstrchrstphr/CCFoundation"
  s.license   = {
    :type => 'MIT',
    :text => <<-LICENSE
              Copyright (C) 2011-2013, Christopher Constable

              Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

              The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

              THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
    LICENSE
  }
  s.author       = { "Christopher Constable" => "chris@futura.io" }
  s.source       = { :git => "https://github.com/mstrchrstphr/CCFoundation.git", :commit => "a996d0f60dbf6e31426919ca47070f99a7d54f99" }
  s.platform     = :ios, '5.0'
  s.source_files = 'Classes', 'CCFoundation/**/*.{h,m}'
  s.frameworks  = 'MapKit', 'QuartzCore', 'CoreLocation'
  s.requires_arc = true
end
