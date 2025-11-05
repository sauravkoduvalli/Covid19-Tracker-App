const Navbar = () => {
  return (
    <header className="sticky top-0 left-0 w-full border-b border-gray-100 z-1 bg-white/30 backdrop-blur-lg">
      <div className="max-w-6xl mx-auto flex items-center justify-between px-4 py-3">
        {/* Logo and Name */}
        <div className="flex items-center gap-2">
          <img src="/images/logo.png" alt="Logo" className="h-8 w-8" />
          <span className="hidden lg:block text-xl font-semibold text-gray-800">
            World Countries
          </span>
        </div>
        {/* Search Bar */}
        <div className="mx-6 flex-1">
          <input
            type="text"
            placeholder="Search countries..."
            className="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-400"
          />
        </div>
        {/* Current Country Flag & Country Name */}
        <div className="hidden md:flex items-center justify-between border border-gray-300 rounded-md px-3 py-2 gap-2">
          <img
            src="/vite.svg"
            alt="Current Country Flag"
            className="h-5 w-5 rounded-full"
          />
          <p className="">Select Country</p>
        </div>
        {/* Theme Switch Icon (placeholder) */}
        <button
          aria-label="Toggle theme"
          className="hidden md:block p-2 rounded-full hover:bg-gray-100 transition ml-2"
        >
          {/* Example: Sun/Moon SVG */}
          <svg
            className="h-6 w-6 text-gray-700"
            fill="none"
            stroke="currentColor"
            strokeWidth={2}
            viewBox="0 0 24 24"
          >
            <path
              d="M12 3v1m0 16v1m8.66-13.66l-.71.71M4.05 19.07l-.71.71M21 12h-1M4 12H3m16.66 5.66l-.71-.71M4.05 4.93l-.71-.71M12 7a5 5 0 100 10 5 5 0 000-10z"
              strokeLinecap="round"
              strokeLinejoin="round"
            />
          </svg>
        </button>
        {/* Hamburger menu (Only after md:) */}
        <button
          aria-label="Toggle theme"
          className="block p-2 rounded-full hover:bg-gray-100 transition md:hidden"
        >
          <img
            src="/icons/menu.svg"
            alt="Current Country Flag"
            className="h-7 w-7 rounded-full"
          />
        </button>
      </div>
    </header>
  );
};

export default Navbar;
