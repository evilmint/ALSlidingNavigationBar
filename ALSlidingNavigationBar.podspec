Pod::Spec.new do |s|
    s.name = 'ALSlidingNavigationBar'
    s.version = '1.0.0'
    s.license = 'MIT'
    s.summary = 'Slick sliding navigation bar view'
    s.homepage = 'https://github.com/evilmint/ALSlidingNavigationBar'
    s.authors = { 'Aleksander Lorenc' => 'thaxsillion@gmail.com' }
    s.source = { :git => 'https://github.com/evilmint/ALSlidingNavigationBar.git', :tag => '1.0.0' }

    s.ios.deployment_target = '8.0'

    s.source_files = 'Source/**/*'
end
