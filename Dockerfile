
FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
COPY . .
RUN dotnet restore "WeatherForecast/WeatherForecast.csproj"
WORKDIR "/src/WeatherForecast"
RUN dotnet build "WeatherForecast.csproj" -c Release -o /app

FROM build AS publish
WORKDIR "/src/WeatherForecast"
RUN dotnet publish "WeatherForecast.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
EXPOSE 80
EXPOSE 443
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "WeatherForecast.dll"]
