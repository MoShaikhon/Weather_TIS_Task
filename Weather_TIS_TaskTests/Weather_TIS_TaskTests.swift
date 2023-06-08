//
//  Weather_TIS_TaskTests.swift
//  Weather_TIS_TaskTests
//
//  Created by Mohamad Shaikhon on 06/06/2023.
//

import XCTest
@testable import Weather_TIS_Task

final class Weather_TIS_TaskTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    func testGetCurrentWeather_SuccessfulCall() async throws {
        let mockService = MockWeatherService()
        let repository = WeatherRepository(remoteService: mockService)
        let cityName = "Zocca"
        
        guard let path = Bundle.main.path(forResource: "CurrentWeatherResponse", ofType: "json") else {
            XCTFail("CurrentWeatherResponse.json file not found")
            return
        }
        let url = URL(fileURLWithPath: path)
        let data = try Data(contentsOf: url)
        let jsonData = try JSONDecoder().decode(CurrentWeather.self, from: data)
        let successResult: Result<CurrentWeather, NetworkingResponseError> = .success(jsonData)
        mockService.fetchCurrentWeatherResult = successResult
        let result = await repository.getCurrentWeather(at: cityName)
        
        XCTAssertTrue(mockService.fetchCurrentWeatherCalled)
        XCTAssertEqual(mockService.fetchCurrentWeatherCityName, cityName)
        XCTAssertEqual(result, successResult)
    }
}
