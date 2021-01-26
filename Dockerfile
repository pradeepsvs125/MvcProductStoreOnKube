FROM mcr.microsoft.com/dotnet/aspnet:3.1 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:3.1 AS build
WORKDIR /src
COPY ["mycrud.csproj", "./"]
RUN dotnet restore "mycrud.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "mycrud.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "mycrud.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "mycrud.dll"]
