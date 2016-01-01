task :before_assets_precompile do
  system("rake bower:install:deployment['--allow-root'] CI=true")
end

Rake::Task['assets:precompile'].enhance ['before_assets_precompile']
