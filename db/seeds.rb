# frozen_string_literal: true

Product.delete_all
User.delete_all

User.create!(name: 'Wasi', password: '12345')

products = [
  {
    title: 'Docker for Rails Developers',
    description: %(<p> <em>Build, Ship, and Run Your Applications Everywhere</em><br> Docker does for DevOps what Rails did for web development—it gives you a new set of superpowers. Gone are “works on my machine” woes and lengthy setup tasks, replaced instead by a simple, consistent, Docker-based development environment that will have your team up and running in seconds. </p> <p> Gain hands-on, real-world experience with a tool that’s rapidly becoming fundamental to software development. Go from zero all the way to production as Docker transforms the massive leap of deploying your app in the cloud into a baby step. </p>),
    image: 'ridocker.jpg',
    price: 19.95
  },
  {
    title: 'Design and Build Great Web APIs',
    description: %(<p> <em>Robust, Reliable, and Resilient</em><br> APIs are transforming the business world at an increasing pace. Gain the essential skills needed to quickly design, build, and deploy quality web APIs that are robust, reliable, and resilient. </p> <p> Go from initial design through prototyping and implementation to deployment of mission-critical APIs for your organization. Test, secure, and deploy your API with confidence and avoid the “release into production” panic. </p> <p> Tackle just about any API challenge with more than a dozen open-source utilities and common programming patterns you can apply right away. </p>),
    image: 'maapis.jpg',
    price: 24.95
  },
  {
    title: 'Modern CSS with Tailwind',
    description: %(<p> <em>Flexible Styling Without the Fuss</em><br> Tailwind CSS is an exciting utility-first CSS framework that allows you to design your site by composing small utility classes to build complex layouts directly in your markup. </p> <p> With Tailwind, you can style text, control spacing, move elements on the page, and create responsive designs that adapt from mobile phones to wide-screen monitors—all without writing custom CSS. </p> <p> This book teaches you how to take full advantage of Tailwind’s flexibility and consistency, from fine-grained typography adjustments to building complete application layouts. </p>),
    image: 'tailwind.jpg',
    price: 18.95
  }
]

products.each do |p|
  product = Product.create!(
    title: p[:title],
    description: p[:description],
    price: p[:price]
  )

  file_path = Rails.root.join("db/seeds/images", p[:image])

  if File.exist?(file_path)
    product.image.attach(
      io: File.open(file_path),
      filename: p[:image],
      content_type: 'image/jpg'
    )
  else
    puts "Missing file: #{file_path}"
  end
end