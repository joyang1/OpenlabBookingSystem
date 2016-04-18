
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/18/2016 17:04:09
-- Generated from EDMX file: D:\WorkCopy\GitProject\OpenlabBookingSystem\Database.OBS\OBSDatabase.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [{0}];
GO
IF SCHEMA_ID(N'{1}') IS NULL EXECUTE(N'CREATE SCHEMA [{1}]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[{1}].[FK_DepMajor]', 'F') IS NOT NULL
    ALTER TABLE [{1}].[Majors] DROP CONSTRAINT [FK_DepMajor];
GO
IF OBJECT_ID(N'[{1}].[FK_MajorGrade]', 'F') IS NOT NULL
    ALTER TABLE [{1}].[Grades] DROP CONSTRAINT [FK_MajorGrade];
GO
IF OBJECT_ID(N'[{1}].[FK_DepCourse]', 'F') IS NOT NULL
    ALTER TABLE [{1}].[Courses] DROP CONSTRAINT [FK_DepCourse];
GO
IF OBJECT_ID(N'[{1}].[FK_TeacherCourse]', 'F') IS NOT NULL
    ALTER TABLE [{1}].[Courses] DROP CONSTRAINT [FK_TeacherCourse];
GO
IF OBJECT_ID(N'[{1}].[FK_CourseExperimentalProject]', 'F') IS NOT NULL
    ALTER TABLE [{1}].[ExperimentalProjects] DROP CONSTRAINT [FK_CourseExperimentalProject];
GO
IF OBJECT_ID(N'[{1}].[FK_DepLab]', 'F') IS NOT NULL
    ALTER TABLE [{1}].[Labs] DROP CONSTRAINT [FK_DepLab];
GO
IF OBJECT_ID(N'[{1}].[FK_DepTeacher]', 'F') IS NOT NULL
    ALTER TABLE [{1}].[Teachers] DROP CONSTRAINT [FK_DepTeacher];
GO
IF OBJECT_ID(N'[{1}].[FK_DepStudent]', 'F') IS NOT NULL
    ALTER TABLE [{1}].[Students] DROP CONSTRAINT [FK_DepStudent];
GO
IF OBJECT_ID(N'[{1}].[FK_MajorStudent]', 'F') IS NOT NULL
    ALTER TABLE [{1}].[Students] DROP CONSTRAINT [FK_MajorStudent];
GO
IF OBJECT_ID(N'[{1}].[FK_GradeStudent]', 'F') IS NOT NULL
    ALTER TABLE [{1}].[Students] DROP CONSTRAINT [FK_GradeStudent];
GO
IF OBJECT_ID(N'[{1}].[FK_ExperimentalProjectStartedExpriment]', 'F') IS NOT NULL
    ALTER TABLE [{1}].[StartedExpriments] DROP CONSTRAINT [FK_ExperimentalProjectStartedExpriment];
GO
IF OBJECT_ID(N'[{1}].[FK_LabStartedExpriment]', 'F') IS NOT NULL
    ALTER TABLE [{1}].[StartedExpriments] DROP CONSTRAINT [FK_LabStartedExpriment];
GO
IF OBJECT_ID(N'[{1}].[FK_ExperimentalProjectOrder]', 'F') IS NOT NULL
    ALTER TABLE [{1}].[Orders] DROP CONSTRAINT [FK_ExperimentalProjectOrder];
GO
IF OBJECT_ID(N'[{1}].[FK_DepRequiredCourse]', 'F') IS NOT NULL
    ALTER TABLE [{1}].[RequiredCourses] DROP CONSTRAINT [FK_DepRequiredCourse];
GO
IF OBJECT_ID(N'[{1}].[FK_GradeRequiredCourse]', 'F') IS NOT NULL
    ALTER TABLE [{1}].[RequiredCourses] DROP CONSTRAINT [FK_GradeRequiredCourse];
GO
IF OBJECT_ID(N'[{1}].[FK_CourseLab]', 'F') IS NOT NULL
    ALTER TABLE [{1}].[Labs] DROP CONSTRAINT [FK_CourseLab];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[{1}].[Deps]', 'U') IS NOT NULL
    DROP TABLE [{1}].[Deps];
GO
IF OBJECT_ID(N'[{1}].[Majors]', 'U') IS NOT NULL
    DROP TABLE [{1}].[Majors];
GO
IF OBJECT_ID(N'[{1}].[Grades]', 'U') IS NOT NULL
    DROP TABLE [{1}].[Grades];
GO
IF OBJECT_ID(N'[{1}].[Labs]', 'U') IS NOT NULL
    DROP TABLE [{1}].[Labs];
GO
IF OBJECT_ID(N'[{1}].[Teachers]', 'U') IS NOT NULL
    DROP TABLE [{1}].[Teachers];
GO
IF OBJECT_ID(N'[{1}].[Students]', 'U') IS NOT NULL
    DROP TABLE [{1}].[Students];
GO
IF OBJECT_ID(N'[{1}].[Courses]', 'U') IS NOT NULL
    DROP TABLE [{1}].[Courses];
GO
IF OBJECT_ID(N'[{1}].[ExperimentalProjects]', 'U') IS NOT NULL
    DROP TABLE [{1}].[ExperimentalProjects];
GO
IF OBJECT_ID(N'[{1}].[StartedExpriments]', 'U') IS NOT NULL
    DROP TABLE [{1}].[StartedExpriments];
GO
IF OBJECT_ID(N'[{1}].[Weeks1]', 'U') IS NOT NULL
    DROP TABLE [{1}].[Weeks1];
GO
IF OBJECT_ID(N'[{1}].[Orders]', 'U') IS NOT NULL
    DROP TABLE [{1}].[Orders];
GO
IF OBJECT_ID(N'[{1}].[Admins]', 'U') IS NOT NULL
    DROP TABLE [{1}].[Admins];
GO
IF OBJECT_ID(N'[{1}].[Settings]', 'U') IS NOT NULL
    DROP TABLE [{1}].[Settings];
GO
IF OBJECT_ID(N'[{1}].[RequiredCourses]', 'U') IS NOT NULL
    DROP TABLE [{1}].[RequiredCourses];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Deps'
CREATE TABLE [{1}].[Deps] (
    [Id] nvarchar(2)  NOT NULL,
    [Name] nvarchar(100)  NOT NULL,
    [Description] nvarchar(255)  NULL,
    [Note] nvarchar(max)  NULL,
    [Flag] bit  NOT NULL
);
GO

-- Creating table 'Majors'
CREATE TABLE [{1}].[Majors] (
    [Id] nvarchar(4)  NOT NULL,
    [Name] nvarchar(100)  NOT NULL,
    [Description] nvarchar(255)  NOT NULL,
    [Flag] bit  NOT NULL,
    [DepId] nvarchar(2)  NOT NULL
);
GO

-- Creating table 'Grades'
CREATE TABLE [{1}].[Grades] (
    [Id] nvarchar(8)  NOT NULL,
    [Name] nvarchar(100)  NOT NULL,
    [Description] nvarchar(max)  NULL,
    [Flag] bit  NOT NULL,
    [MajorId] nvarchar(4)  NOT NULL
);
GO

-- Creating table 'Labs'
CREATE TABLE [{1}].[Labs] (
    [Id] uniqueidentifier  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [CourseId] uniqueidentifier  NOT NULL,
    [DepId] nvarchar(2)  NOT NULL,
    [LimitedNum] smallint  NOT NULL,
    [Note] nvarchar(max)  NULL,
    [Flag] bit  NOT NULL
);
GO

-- Creating table 'Teachers'
CREATE TABLE [{1}].[Teachers] (
    [Id] uniqueidentifier  NOT NULL,
    [Name] nvarchar(100)  NOT NULL,
    [Password] nvarchar(100)  NOT NULL,
    [Sex] smallint  NOT NULL,
    [Phone] nvarchar(255)  NOT NULL,
    [Email] nvarchar(255)  NOT NULL,
    [DepId] nvarchar(2)  NOT NULL,
    [Permission] smallint  NOT NULL,
    [Flag] bit  NOT NULL
);
GO

-- Creating table 'Students'
CREATE TABLE [{1}].[Students] (
    [Id] nvarchar(10)  NOT NULL,
    [Name] nvarchar(100)  NOT NULL,
    [Sex] smallint  NOT NULL,
    [Birth] nvarchar(6)  NOT NULL,
    [DepId] nvarchar(2)  NOT NULL,
    [MajorId] nvarchar(4)  NOT NULL,
    [GradeId] nvarchar(8)  NOT NULL,
    [Year] int  NOT NULL,
    [IdNumber] nvarchar(500)  NOT NULL
);
GO

-- Creating table 'Courses'
CREATE TABLE [{1}].[Courses] (
    [Id] uniqueidentifier  NOT NULL,
    [Name] nvarchar(100)  NOT NULL,
    [Period] smallint  NOT NULL,
    [Description] nvarchar(255)  NULL,
    [TeacherId] uniqueidentifier  NOT NULL,
    [Quality] smallint  NOT NULL,
    [RequiredNum] smallint  NOT NULL,
    [LimitedNum] smallint  NOT NULL,
    [OptionalNum] smallint  NOT NULL,
    [DepId] nvarchar(2)  NOT NULL
);
GO

-- Creating table 'ExperimentalProjects'
CREATE TABLE [{1}].[ExperimentalProjects] (
    [Id] uniqueidentifier  NOT NULL,
    [Name] nvarchar(100)  NOT NULL,
    [Period] smallint  NOT NULL,
    [MinNum] int  NOT NULL,
    [MaxNum] int  NOT NULL,
    [Description] nvarchar(255)  NULL,
    [Requirement] nvarchar(255)  NOT NULL,
    [Purpose] nvarchar(255)  NOT NULL,
    [Quality] smallint  NOT NULL,
    [IsStartedByGrade] bit  NOT NULL,
    [CourseId] uniqueidentifier  NOT NULL
);
GO

-- Creating table 'StartedExpriments'
CREATE TABLE [{1}].[StartedExpriments] (
    [Id] uniqueidentifier  NOT NULL,
    [ExpId] uniqueidentifier  NOT NULL,
    [Times] nvarchar(255)  NOT NULL,
    [Week] nvarchar(255)  NOT NULL,
    [Weekday] nvarchar(100)  NOT NULL,
    [LabId] uniqueidentifier  NOT NULL,
    [TeacherId] uniqueidentifier  NULL,
    [Semester] nvarchar(9)  NOT NULL
);
GO

-- Creating table 'Weeks1'
CREATE TABLE [{1}].[Weeks1] (
    [Id] uniqueidentifier  NOT NULL,
    [StartedWeek] int  NOT NULL,
    [EndedWeek] int  NOT NULL,
    [RestedWeek] nvarchar(255)  NOT NULL
);
GO

-- Creating table 'Orders'
CREATE TABLE [{1}].[Orders] (
    [Id] uniqueidentifier  NOT NULL,
    [StudentIds] nvarchar(max)  NOT NULL,
    [ExpId] uniqueidentifier  NOT NULL,
    [Time] nvarchar(255)  NOT NULL
);
GO

-- Creating table 'Admins'
CREATE TABLE [{1}].[Admins] (
    [Id] uniqueidentifier  NOT NULL,
    [Name] nvarchar(100)  NOT NULL,
    [Permission] nvarchar(max)  NOT NULL,
    [Password] nvarchar(100)  NOT NULL
);
GO

-- Creating table 'Settings'
CREATE TABLE [{1}].[Settings] (
    [Id] uniqueidentifier  NOT NULL,
    [StartedOrderTime] int  NOT NULL,
    [StudentChangedTime] int  NOT NULL,
    [TeacherChangedTime] int  NOT NULL,
    [EndTime] int  NOT NULL
);
GO

-- Creating table 'RequiredCourses'
CREATE TABLE [{1}].[RequiredCourses] (
    [Id] uniqueidentifier  NOT NULL,
    [Name] nvarchar(100)  NOT NULL,
    [GradeIds] nvarchar(8)  NOT NULL,
    [DepIds] nvarchar(2)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Deps'
ALTER TABLE [{1}].[Deps]
ADD CONSTRAINT [PK_Deps]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Majors'
ALTER TABLE [{1}].[Majors]
ADD CONSTRAINT [PK_Majors]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Grades'
ALTER TABLE [{1}].[Grades]
ADD CONSTRAINT [PK_Grades]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Labs'
ALTER TABLE [{1}].[Labs]
ADD CONSTRAINT [PK_Labs]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Teachers'
ALTER TABLE [{1}].[Teachers]
ADD CONSTRAINT [PK_Teachers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Students'
ALTER TABLE [{1}].[Students]
ADD CONSTRAINT [PK_Students]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Courses'
ALTER TABLE [{1}].[Courses]
ADD CONSTRAINT [PK_Courses]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ExperimentalProjects'
ALTER TABLE [{1}].[ExperimentalProjects]
ADD CONSTRAINT [PK_ExperimentalProjects]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'StartedExpriments'
ALTER TABLE [{1}].[StartedExpriments]
ADD CONSTRAINT [PK_StartedExpriments]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Weeks1'
ALTER TABLE [{1}].[Weeks1]
ADD CONSTRAINT [PK_Weeks1]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Orders'
ALTER TABLE [{1}].[Orders]
ADD CONSTRAINT [PK_Orders]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Admins'
ALTER TABLE [{1}].[Admins]
ADD CONSTRAINT [PK_Admins]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Settings'
ALTER TABLE [{1}].[Settings]
ADD CONSTRAINT [PK_Settings]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'RequiredCourses'
ALTER TABLE [{1}].[RequiredCourses]
ADD CONSTRAINT [PK_RequiredCourses]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [DepId] in table 'Majors'
ALTER TABLE [{1}].[Majors]
ADD CONSTRAINT [FK_DepMajor]
    FOREIGN KEY ([DepId])
    REFERENCES [{1}].[Deps]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DepMajor'
CREATE INDEX [IX_FK_DepMajor]
ON [{1}].[Majors]
    ([DepId]);
GO

-- Creating foreign key on [MajorId] in table 'Grades'
ALTER TABLE [{1}].[Grades]
ADD CONSTRAINT [FK_MajorGrade]
    FOREIGN KEY ([MajorId])
    REFERENCES [{1}].[Majors]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MajorGrade'
CREATE INDEX [IX_FK_MajorGrade]
ON [{1}].[Grades]
    ([MajorId]);
GO

-- Creating foreign key on [DepId] in table 'Courses'
ALTER TABLE [{1}].[Courses]
ADD CONSTRAINT [FK_DepCourse]
    FOREIGN KEY ([DepId])
    REFERENCES [{1}].[Deps]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DepCourse'
CREATE INDEX [IX_FK_DepCourse]
ON [{1}].[Courses]
    ([DepId]);
GO

-- Creating foreign key on [TeacherId] in table 'Courses'
ALTER TABLE [{1}].[Courses]
ADD CONSTRAINT [FK_TeacherCourse]
    FOREIGN KEY ([TeacherId])
    REFERENCES [{1}].[Teachers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TeacherCourse'
CREATE INDEX [IX_FK_TeacherCourse]
ON [{1}].[Courses]
    ([TeacherId]);
GO

-- Creating foreign key on [CourseId] in table 'ExperimentalProjects'
ALTER TABLE [{1}].[ExperimentalProjects]
ADD CONSTRAINT [FK_CourseExperimentalProject]
    FOREIGN KEY ([CourseId])
    REFERENCES [{1}].[Courses]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CourseExperimentalProject'
CREATE INDEX [IX_FK_CourseExperimentalProject]
ON [{1}].[ExperimentalProjects]
    ([CourseId]);
GO

-- Creating foreign key on [DepId] in table 'Labs'
ALTER TABLE [{1}].[Labs]
ADD CONSTRAINT [FK_DepLab]
    FOREIGN KEY ([DepId])
    REFERENCES [{1}].[Deps]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DepLab'
CREATE INDEX [IX_FK_DepLab]
ON [{1}].[Labs]
    ([DepId]);
GO

-- Creating foreign key on [DepId] in table 'Teachers'
ALTER TABLE [{1}].[Teachers]
ADD CONSTRAINT [FK_DepTeacher]
    FOREIGN KEY ([DepId])
    REFERENCES [{1}].[Deps]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DepTeacher'
CREATE INDEX [IX_FK_DepTeacher]
ON [{1}].[Teachers]
    ([DepId]);
GO

-- Creating foreign key on [DepId] in table 'Students'
ALTER TABLE [{1}].[Students]
ADD CONSTRAINT [FK_DepStudent]
    FOREIGN KEY ([DepId])
    REFERENCES [{1}].[Deps]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DepStudent'
CREATE INDEX [IX_FK_DepStudent]
ON [{1}].[Students]
    ([DepId]);
GO

-- Creating foreign key on [MajorId] in table 'Students'
ALTER TABLE [{1}].[Students]
ADD CONSTRAINT [FK_MajorStudent]
    FOREIGN KEY ([MajorId])
    REFERENCES [{1}].[Majors]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MajorStudent'
CREATE INDEX [IX_FK_MajorStudent]
ON [{1}].[Students]
    ([MajorId]);
GO

-- Creating foreign key on [GradeId] in table 'Students'
ALTER TABLE [{1}].[Students]
ADD CONSTRAINT [FK_GradeStudent]
    FOREIGN KEY ([GradeId])
    REFERENCES [{1}].[Grades]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_GradeStudent'
CREATE INDEX [IX_FK_GradeStudent]
ON [{1}].[Students]
    ([GradeId]);
GO

-- Creating foreign key on [ExpId] in table 'StartedExpriments'
ALTER TABLE [{1}].[StartedExpriments]
ADD CONSTRAINT [FK_ExperimentalProjectStartedExpriment]
    FOREIGN KEY ([ExpId])
    REFERENCES [{1}].[ExperimentalProjects]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ExperimentalProjectStartedExpriment'
CREATE INDEX [IX_FK_ExperimentalProjectStartedExpriment]
ON [{1}].[StartedExpriments]
    ([ExpId]);
GO

-- Creating foreign key on [LabId] in table 'StartedExpriments'
ALTER TABLE [{1}].[StartedExpriments]
ADD CONSTRAINT [FK_LabStartedExpriment]
    FOREIGN KEY ([LabId])
    REFERENCES [{1}].[Labs]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_LabStartedExpriment'
CREATE INDEX [IX_FK_LabStartedExpriment]
ON [{1}].[StartedExpriments]
    ([LabId]);
GO

-- Creating foreign key on [ExpId] in table 'Orders'
ALTER TABLE [{1}].[Orders]
ADD CONSTRAINT [FK_ExperimentalProjectOrder]
    FOREIGN KEY ([ExpId])
    REFERENCES [{1}].[ExperimentalProjects]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ExperimentalProjectOrder'
CREATE INDEX [IX_FK_ExperimentalProjectOrder]
ON [{1}].[Orders]
    ([ExpId]);
GO

-- Creating foreign key on [DepIds] in table 'RequiredCourses'
ALTER TABLE [{1}].[RequiredCourses]
ADD CONSTRAINT [FK_DepRequiredCourse]
    FOREIGN KEY ([DepIds])
    REFERENCES [{1}].[Deps]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DepRequiredCourse'
CREATE INDEX [IX_FK_DepRequiredCourse]
ON [{1}].[RequiredCourses]
    ([DepIds]);
GO

-- Creating foreign key on [GradeIds] in table 'RequiredCourses'
ALTER TABLE [{1}].[RequiredCourses]
ADD CONSTRAINT [FK_GradeRequiredCourse]
    FOREIGN KEY ([GradeIds])
    REFERENCES [{1}].[Grades]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_GradeRequiredCourse'
CREATE INDEX [IX_FK_GradeRequiredCourse]
ON [{1}].[RequiredCourses]
    ([GradeIds]);
GO

-- Creating foreign key on [CourseId] in table 'Labs'
ALTER TABLE [{1}].[Labs]
ADD CONSTRAINT [FK_CourseLab]
    FOREIGN KEY ([CourseId])
    REFERENCES [{1}].[Courses]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CourseLab'
CREATE INDEX [IX_FK_CourseLab]
ON [{1}].[Labs]
    ([CourseId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------