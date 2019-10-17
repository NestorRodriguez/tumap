import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { NivelPage } from './nivel.page';

describe('NivelPage', () => {
  let component: NivelPage;
  let fixture: ComponentFixture<NivelPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ NivelPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(NivelPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
