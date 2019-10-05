import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ExportarPage } from './exportar.page';

describe('ExportarPage', () => {
  let component: ExportarPage;
  let fixture: ComponentFixture<ExportarPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ExportarPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ExportarPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
