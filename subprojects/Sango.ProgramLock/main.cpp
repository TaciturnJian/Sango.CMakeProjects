#include <iostream>
#include <chrono>
#include <thread>
#include <sstream>

constexpr auto DefaultProgramName = "ProgramLock";
constexpr auto DefaultSleepPeriod_ms = 120000;

int main(int argc, const char** argv) {
	unsigned long long SleepPeriod_ms = DefaultSleepPeriod_ms;
	//Parse Argument: SleepPeriod_ms
	std::string ProgramName = DefaultProgramName;
	if (argc > 1) {
		ProgramName = std::string(argv[0]);

		std::istringstream stream;
		stream.clear();
		stream.str(argv[1]);
		try {
			stream >> SleepPeriod_ms; 
		}
		catch (std::exception ex) {
			std::cout << ex.what() << std::endl;
			std::cout << "Set Sleep Period to Default(" << DefaultSleepPeriod_ms << ") " << std::endl;
			SleepPeriod_ms = DefaultSleepPeriod_ms;
		}
	}

	std::cout << "Start Program Lock(" << ProgramName << "), Sleep Period (" << SleepPeriod_ms <<"ms) " << std::endl;
	while (true) {
		std::cout << "Program Lock is Running" << std::endl;
		std::this_thread::sleep_for(std::chrono::milliseconds(SleepPeriod_ms));
	}

	return 0;
}
